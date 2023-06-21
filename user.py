from mysqlconnection import connectToMySQL

class User:
    def __init__( self, data ):
        self.id = data['user_id']
        self.first_name = data['first_name']
        self.last_name = data['last_name']
        self.email = data['email']
        self.password = data['password']
        self.phone_number = data['phone_number']
        self.organization_name = data['organization_name']
        self.street_address = data['street_address']
        self.state = data['state']
        self.zip_code = data['zip_code']
        self.created_at = data['created_at']
        self.updated_at = data['updated_at']
    
    @classmethod
    def get_all(cls):
        query = "SELECT * FROM users;"
        results = connectToMySQL("second_opinions").query_db(query)
        users = []
        for user in results:
            users.append(cls(user))
        return users 