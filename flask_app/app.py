from timescale_db_utils import answer_user_question

from flask import Flask, request, jsonify

# Initialize the Flask application
app = Flask(__name__)

@app.route('/generate', methods=['POST'])
def generate_text():
    # Get the input data from the request
    data = request.json
    query = data.get('query', None)

    # Generate text using the language model
    generated_text = answer_user_question(query)

    # Return the generated text as a JSON response
    return jsonify(generated_text)

if __name__ == '__main__':
    app.run(debug=True)