from flask import Flask
from model import users

app = Flask(__name__)

@app.route('/users/get_user_data/<user_id>')
def get_user_id(user_id):
    user_name = users.get_user(user_id)
    if not user_name:
        return f'<H1 id="error">no user with such id: {user_id}</H1>'
    return f'<H1 id="user">{user_name[0]}</H1>'


if __name__ == '__main__':
    app.run(port=5001)
