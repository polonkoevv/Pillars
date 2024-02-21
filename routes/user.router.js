import { Router } from "express";
import userController from "../controllers/user.controller.js";
import authMiddleware from "../middlewares/auth.middleware.js";

const userRouter = Router()

userRouter.post("/register", userController.Register)

userRouter.post("/login", userController.Login)
 
userRouter.delete("/:id", userController.Delete)

userRouter.put("/:id", authMiddleware.checkToken, userController.UpdateInfo)

// userRouter.get("/:id", authMiddleware.checkToken, authMiddleware.theSameId, userController.GetBio)

userRouter.get("/", userController.GetAllBio)

// userRouter.get("/bookings", userController.GetAllInfo)

userRouter.get("/bookings", authMiddleware.checkToken, userController.GetInfo)


export default userRouter