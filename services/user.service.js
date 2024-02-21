import { pool } from "../storage/connection.js"
import pino from "../logger/logger.js"
import jwt from "jsonwebtoken"
import bookingService from "./booking.service.js"
class userService {
    async Register(user) {
        try {
            var res = await pool.query("INSERT INTO user SET firstname = ?, lastname = ?, middlename = ?, email = ?, phonenumber = ?, password = ?",
                [
                    user.firstname,
                    user.lastname,
                    user.middlename,
                    user.email,
                    user.phonenumber,
                    user.password

                ])
            return res
        } catch (error) {
            pino.info(error)
            return null
        }
    }

    async Login(sign_var, password) {
        
        let user

        pino.info("Login type email")
        user = await this.GetBioByEmail(sign_var)

        if (user == null || user == {} || user == []){
            pino.info("Login type phonenumber")
            user = await this.GetBioByNumber(sign_var)
        }
        
        if (user == null){
            return null
        }

        pino.debug(user) 

        if (user == null){
            return null
        }

        if (user.password != password){
            return null
        }

        const token = jwt.sign(
            {
            id: user.id, 
            firstname: user.firstname,
            lastname: user.lastname,
            middlename: user.middlename,
            email: user.email,
            phonenumber: user.phonenumber
        }, process.env.TOKEN_KEY, {expiresIn: "1h", algorithm: "HS256"});

        return token
    }

    async GetInfo(id){
        
        pino.debug(id)
        try {
            let user = await this.GetBio(id)
            let bookings = await bookingService.GetByUserId(id)

            // user.bookings = []
            user.bookings  = bookings
            // user.bookings = user.bookings.concat(bookings)

            return user

        } catch (error) {
            pino.info(error)
            return error            
        }

    }

    async GetAllInfo(){
        // TODO:

    }

    async GetBio(id) {
        try {
            var res = await pool.query("SELECT id,firstname,lastname,middlename,email,phonenumber FROM user WHERE id = ?", [id])
            pino.debug(res[0][0])
            return res[0][0]
        } catch (error) {
            pino.info(error)
            return error
        }
    }

    async GetBioByNumber(phone){
        try {
            var res = await pool.query("SELECT * FROM user WHERE phonenumber = ?", [phone])
            pino.info(res)
            return res[0][0]
        } catch (error) {
            pino.info(error)
            return error
        }
    }

    async GetBioByEmail(email){
        try {
            pino.info(email)
            var res = await pool.query("SELECT * FROM user WHERE email = ?", [email])
            pino.info(res)
            return res[0][0]
        } catch (error) {
            pino.info(error)
            return error
        }
    }

    async GetAllBio() {
        try {
            var res = await pool.query("SELECT * FROM user")
            pino.info(res[0])
            return res[0]
        } catch (error) {
            pino.info(error)
            return error
        }
    }

    async UpdateInfo(id, user) {
        try {
            var res = await pool.query("UPDATE user SET firstname = ?, lastname = ?, middlename = ?, email = ?, phonenumber = ?, password = ? WHERE id = ?",
                [
                    user.firstname,
                    user.lastname,
                    user.middlename,
                    user.email,
                    user.phonenumber,
                    user.password,
                    id
                ])
            return res
        } catch (error) {
            pino.info(error)
            return error
        }
    }

    async Delete(id) {
        try {
            var res = await pool.query("DELETE user WHERE id = ?", [id])
            return res
        } catch (error) {
            pino.info(error)
            return error
        }
    }
}

export default new userService()