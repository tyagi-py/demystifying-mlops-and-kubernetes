import socket
from fastapi import FastAPI
from fastapi.responses import JSONResponse
import sys
import os
from app.ml.textprocessing import predict
app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "World"}

@app.get("/find-sentiment/")
def read_item(sentence: str):
    results = predict(sentence)
    docker_short_id = socket.gethostname()
    results['server id'] = str(docker_short_id)
    return JSONResponse(content=results)



