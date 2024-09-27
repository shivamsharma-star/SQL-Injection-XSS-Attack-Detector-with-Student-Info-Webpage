import pickle

# Load the trained machine learning model
with open('ml_model.pkl', 'rb') as model_file:
    model = pickle.load(model_file)

def check(input_data):
    # Predict using the pre-trained model
    prediction = model.predict([input_data])
    
    # If prediction indicates an attack, return 1, otherwise return 0
    if prediction[0] == 1:
        return 1  # Unsafe (SQL Injection or XSS attack detected)
    else:
        return 0  # Safe
