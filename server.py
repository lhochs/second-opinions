from flask import Flask, render_template, request, redirect, session

from user import User

app = Flask(__name__)
app.secret_key = "Chicago2435"

@app.route('/') 
def index():
    return render_template("index.html")

@app.route("/users", methods=['POST'])
def create_user():
    print("POST input received")
    print(request.form)
    return redirect('/')

@app.route("/show")
def show_user_info():
    # print("Showing the User Info From the Form")
    # print(request.form)
    users = User.get_all()
    print(users)
    return render_template("show.html")

if __name__=="__main__":   # Ensure this file is being run directly and not from a different module    
    app.run(debug=True)    # Run the app in debug mode.