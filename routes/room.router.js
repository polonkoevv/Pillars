import { Router } from "express";
import roomController from "../controllers/room.controller.js";


const roomRouter = Router()

roomRouter.post("/", roomController.Add)
roomRouter.get("/", roomController.GetAll)
roomRouter.get("/:id", roomController.Get)
roomRouter.put("/:id", roomController.Update)
roomRouter.delete("/:id", roomController.Delete)


export default roomRouter