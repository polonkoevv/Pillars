import { pool } from "../storage/connection.js"
import pino from "../logger/logger.js"

class roomService {
    async Add(room){
        console.info("adding room")
        let convlist = ["tv", "conditioner", "mirror", "bathroom", "breakfast", "safe", "hair_druer", "wifi"]
        try {
            let query = ""
            let query_list = []
            let conv = room.convinient
            convlist.map(function(c){
                if (conv[c] == true){
                    query += `${c} = 1,`
                }
            })
            pino.info(query)
            
            let convquery = await pool.query(
                `INSERT INTO convinient SET ${query.substring(0, query.length - 1)}`
            )

            let lastId = convquery[0].insertId
            pino.info(lastId)

            

            let res = await pool.query("INSERT INTO room SET room_number = ?, max_guest_number = ?, bed_number = ?, price_night = ?, description = ?, convinient = ?, title = ?", 
            [
                room.room_number,
                room.max_guest_number,
                room.bed_number,
                room.price_night,
                room.description,
                lastId,
                room.title
            ])
            return res
        } catch (error) {
            pino.info(error)
            return error
        }
    }

    async Get(id){
        try {
            let res = await pool.query("SELECT * FROM room WHERE id = ? ", [id])
            res = res[0][0]
            // pino.info(res.convinient)
            let conv = await pool.query("SELECT * FROM convinient WHERE id = ?", [res.convinient])
            // pino.info(conv)
            res.convinient =  conv[0]
            // pino.info(res)
            return res
        } catch (error) {
            pino.info(error)
            return error
        }
    }
    
    async GetAll(){
        console.info("getting rooms")
        try {
            let res = await pool.query("SELECT * FROM room")
            res = res[0]

            for (let i = 0; i < res.length; i++){
                // pino.info(res[i].convinient)
                let conv = await pool.query("SELECT * FROM convinient WHERE id = ?", [res[i].convinient])
                // pino.info(conv)
                res[i].convinient =  conv[0][0]
                // pino.info(res[i].convinient)
            }
            pino.debug(res)
            return res
        } catch (error) {
            pino.info(error)
            return error
        }
    }
    
    async Update(){ }

    async Delete(id){
        try {
            let res = await pool.query("DELETE FROM room WHERE id = ?", id)
            return res
        } catch (error) {
            pino.info(error)
            return error
        }
    }
}

export default new roomService()