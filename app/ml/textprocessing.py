import os
os.environ['KMP_DUPLICATE_LIB_OK']='True'
import numpy as np
from transformers import AutoTokenizer, AutoModelForSequenceClassification

from scipy.special import softmax

tokenizer = AutoTokenizer.from_pretrained("./app/models/twitter-roberta-base-sentiment-tokenizer")
model = AutoModelForSequenceClassification.from_pretrained("./app/models/twitter-roberta-base-sentiment")

def preprocess(text):
    new_text = []
    for t in text.split(" "):
        t = '@user' if t.startswith('@') and len(t) > 1 else t
        t = 'http' if t.startswith('http') else t
        new_text.append(t)
    return " ".join(new_text)

# PT
def predict(text):
    text = preprocess(text)
    encoded_input = tokenizer(text, return_tensors='pt')
    output = model(**encoded_input)
    scores = output[0][0].detach().numpy()
    scores = softmax(scores)


    label = {0: 'negative', 1: 'neutral', 2: 'positive'}
    ranking = np.argsort(scores)
    ranking = ranking[::-1]
    results = dict()
    for i in range(scores.shape[0]):
        l = label[ranking[i]]
        s = scores[ranking[i]]
        results[str(l)] = str(s)

    return results