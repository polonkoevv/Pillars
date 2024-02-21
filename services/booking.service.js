import { pool } from "../storage/connection.js"
import roomService from "./room.service.js"
import pino from "../logger/logger.js"
class bookingService {
    async Add(booking, id){
        try {
            pino.info(`adding new booking; user = ${id}`)
            let price = (await roomService.Get(booking.room_id)).price_night
            let latency = Math.ceil(Math.abs(new Date(booking.end_date) - new Date(booking.start_date)) / (1000 * 60 * 60 * 24)) + 1
            pino.debug(price)
            pino.debug(latency)
            let res = await pool.query("INSERT INTO booking SET start_date = ?, end_date = ?, user_id = ?, room_id = ?, price = ?, latency = ?, adults = ?, childs = ?",
            [
                new Date(booking.start_date),
                new Date(booking.end_date),
                id,
                booking.room_id,
                latency * price ,
                latency,
                booking.adults,
                booking.childs
            ])
            pino.info(`booking added id = ${res[0].insertId}`)
            pino.debug(res)
            return res

        } catch (error) {
            console.error("error while adding booking")
            pino.info(error)
            return error
        }
    }

    async Get(id){
        try {
            let res = await pool.query("SELECT * FROM booking WHERE id = ?", [id])
            return res[0][0]
        } catch (error) {
            pino.info(error)
            return error
        }
    }

    async GetByUserId(id){
        try {
            pino.info(`getting all the bookings of user = ${id}`)
            let res = await pool.query("SELECT * FROM booking WHERE user_id = ?", [id])
            res = res[0]
            for (let i = 0; i < res.length; i++){
                res[i].room = await roomService.Get(res[i].room_id)
            }

            return res
        } catch (error) {
            pino.info("error while getting bookings", error.message)
            return error
        }
    }

    async GetAll(){
        try {
            let res = await pool.query("SELECT * FROM booking")
            res = res[0]
            for (let i = 0; i < res.length; i++){
                res[i].room = await roomService.Get(res[1].room_id)
            }
            return res
        } catch (error) {
            pino.info(error)
            return error
        }
    }

    async Delete(id){
        try {
            let res = await pool.query("DELETE FROM booking WHERE id = ?", [id])
            return res[0]
        } catch (error) {
            pino.info(error)
            return error
        }
    }

    async Update(){

    }
}

export default new bookingService()