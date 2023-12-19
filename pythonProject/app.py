from flask import Flask, render_template


app = Flask(__name__)

@app.route('/')
@app.route('/home')
def index():
    return render_template("index.html")

@app.route('/student')
def about():
    return render_template("student.html")

if __name__ == "__main__":
    app.run(debug=True)