import os
from fastapi import FastAPI

app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello World Calvin"}

@app.get("/goodbye")
async def root():
    return {"message": "Goodbye World Calvin"}

@app.get("/login")
async def root():
    username = os.getenv("USERNAME")
    password = os.getenv("PASSWORD")
    return {
                "message": f"username: {username}  password: {password}"
           }