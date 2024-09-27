from flask import Flask, request, jsonify
from model import check

app = Flask(__name__)

@app.route('/detect', methods=['POST'])
def detect_attack():
    # Get the input (e.g., enrollment_no) from the POST request
    input_data = request.json.get('enrollmentno')
    
    if not input_data:
        return jsonify({"error": "Enrollment number not provided"}), 400
    
    # Use the check function from model.py to determine if input is safe or not
    is_safe = check(input_data)
    
    # Return the result: 0 for safe, 1 for unsafe
    result = {
        "enrollmentno": input_data,
        "is_safe": is_safe
    }
    
    return jsonify(result)

if __name__ == '__main__':
    app.run(debug=True)
