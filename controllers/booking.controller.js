import jwt from "jsonwebtoken"
import bookingService from "../services/booking.service.js";

class bookingController{
    // Добавление бронирования
    async Add(req, res){


        let authHeader = req.headers.authorization
        if (authHeader == null){
            return res.status(401).send()
        }
        let token = authHeader.split(" ")[1]
        let decoded = jwt.decode(token)
        let id = decoded.id
        let result = await bookingService.Add(req.body, id)
        res.send(result)
        return
    }
    // Получение бронирования по id

    async Get(req, res){
        let id = req.params.id
        let result = await bookingService.Get(id)
        res.send(result)
        return
    }
    // Получение бронирований
    

    async GetAll(req, res){
        let result = await bookingService.GetAll()
        res.send(result)
        return
    }
    // Удаление бронирования по id
    async Delete(req, res){
        let id = req.params.id
        let result = await bookingService.Delete(id)
        res.send(result)
        return
    }
    async Update(req, res){}
}

export default new bookingController()