import User from "../models/user.model.js"
import jwt from "jsonwebtoken"
import userService from "../services/user.service.js"

class userController {
    async Register(req, res) {

        console.log(req.body)
        let result = await userService.Register(req.body)
        if (result == null){
            res.status(400)
        }
        res.send(result)        
        return
    }

    async Login(req, res) {
        let sign_var = req.body.sign_var
        let password = req.body.password

        console.log(sign_var)

        let result = await userService.Login(sign_var, password)

        if (result == null){
            res.status(400)
            res.send(result)
            return
        }
        
        res.json({"token": result})
        return
    }

    async GetInfo(req, res){
        // console.log("Checking")
        let authHeader = req.headers.authorization
        if (authHeader == null){
            return res.status(401).send()
        }
        let token = authHeader.split(" ")[1]
        
        let decoded = jwt.decode(token)
        // console.log("123123jj")
        let id = decoded.id

        let result = await userService.GetInfo(id)

        return res.send(result)

        
    }

    async GetAllInfo(req, res){
        // TODO:
        return
    }

    async GetBio(req, res) {
        let id = req.params.id
        let result = await userService.GetBio(id)
        res.send(result)        
        return
    }

    async GetAllBio(req, res) {
        let result = await userService.GetAllBio()
        res.send(result)        
        return
    }

    async UpdateInfo(req, res) {
        console.log(req.body)
        let result = await userService.UpdateInfo(req.params.id, req.body)
        res.send(result)
        return        
    }

    async Delete(req, res) {
        let result = await userService.Delete(req.params.id)
        res.send(result)
        return         
    }
}

export default new userController()