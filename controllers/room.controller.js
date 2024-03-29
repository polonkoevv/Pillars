import roomService from "../services/room.service.js"

class roomController {
    async Add(req,res){
        let result = await roomService.Add(req.body)
        res.send(result)
    }

    async Get(req,res){
        let result = await roomService.Get(req.params.id)
        res.send(result)
        return
    }
    
    async GetAll(req,res){
        let result = await roomService.GetAll()
        res.send(result)
        return
    }
    
    async Update(req,res){}

    async Delete(req,res){
        let id = req.params.id
        let result = await roomService.Delete(id)
        res.send(result)
        return 
    }
}



export default new roomController()