import express  from "express";
import roomRouter from "./routes/room.router.js";
import userRouter from "./routes/user.router.js";
import dotenv from 'dotenv'
import cors from "cors"
import bookingRouter from "./routes/booking.router.js";
import path from 'path'
import pino from "./logger/logger.js"
const __dirname = path.resolve()

dotenv.config()

// Создание сервера
const app = express()
app.use(express.json())
app.use(express.urlencoded({extended: true}))
app.use(cors()) 
// Добавление роутеров
app.use("/room", roomRouter)
app.use("/user", userRouter)
app.use("/booking", bookingRouter)

app.use(express.static(path.resolve(__dirname, 'static')))

const PORT = process.env.APP_PORT || 3000

app.listen(PORT, () =>{
    console.log()
    pino.info(`Server is running on port ${PORT}...`)
    
})
