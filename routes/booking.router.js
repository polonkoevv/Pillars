import { Router } from "express";
import bookingController from "../controllers/booking.controller.js";
import authMiddleware from "../middlewares/auth.middleware.js";


const bookingRouter = Router()

bookingRouter.post("/", authMiddleware.checkToken, bookingController.Add)
bookingRouter.get("/", bookingController.GetAll)
bookingRouter.get("/:id", bookingController.Get)
bookingRouter.put("/:id", bookingController.Update)
bookingRouter.delete("/:id", bookingController.Delete)


export default bookingRouter