from flask import Flask, render_template, request, redirect, session

app = Flask(__name__)

@app.route('/') 
def index():
    return render_template("index.html")

@app.route("/users", methods=['POST'])
def create_user():
    print

if __name__=="__main__":   # Ensure this file is being run directly and not from a different module    
    app.run(debug=True)    # Run the app in debug mode.