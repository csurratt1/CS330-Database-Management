import mysql.connector
from mysql.connector import Error

def create_connection():
    try:
        connection = mysql.connector.connect(
            host="localhost",
            port=3306,
            user="Colton",
            password="p70I6PnwKWWtr6",
            database="letterboxd" 
        )
        if connection.is_connected():
            print("Successfully connected to the database!")
            return connection
    except Error as e:
        print(f"Detailed error: {e}")
        return None

def read_all_records(connection):
    try:
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM movies")
        records = cursor.fetchall()
        print("\nAll Movies in Database:")
        print("ID | Title | Director | Year | Rating")
        print("-" * 50)
        for row in records:
            print(f"{row[0]} | {row[1]} | {row[2]} | {row[3]} | {row[4]}")
    except Error as e:
        print(f"Error reading records: {e}")

def create_record(connection):
    try:
        cursor = connection.cursor()
        title = input("Enter movie title: ")
        director = input("Enter director name: ")
        year = input("Enter release year: ")
        rating = input("Enter your rating (0-5): ")
        
        sql = "INSERT INTO movies (title, director, year, rating) VALUES (%s, %s, %s, %s)"
        values = (title, director, year, rating)
        
        cursor.execute(sql, values)
        connection.commit()
        print("New movie added successfully!")
    except Error as e:
        print(f"Error creating record: {e}")

def update_record(connection):
    try:
        cursor = connection.cursor()
        movie_id = input("Enter the ID of the movie to update: ")
        rating = input("Enter new rating (0-5): ")
        
        sql = "UPDATE movies SET rating = %s WHERE id = %s"
        values = (rating, movie_id)
        
        cursor.execute(sql, values)
        connection.commit()
        print("Movie rating updated successfully!")
    except Error as e:
        print(f"Error updating record: {e}")

def delete_record(connection):
    try:
        cursor = connection.cursor()
        movie_id = input("Enter the ID of the movie to delete: ")
        
        sql = "DELETE FROM movies WHERE id = %s"
        values = (movie_id,)
        
        cursor.execute(sql, values)
        connection.commit()
        print("Movie deleted successfully!")
    except Error as e:
        print(f"Error deleting record: {e}")

def main():
    connection = create_connection()
    if connection is None:
        return

    while True:
        print("\n=== Letterboxd Movie Database ===")
        print("1. View all movies")
        print("2. Add new movie")
        print("3. Update movie rating")
        print("4. Delete movie")
        print("5. Exit")
        
        choice = input("\nEnter your choice (1-5): ")
        
        if choice == '1':
            read_all_records(connection)
        elif choice == '2':
            create_record(connection)
        elif choice == '3':
            update_record(connection)
        elif choice == '4':
            delete_record(connection)
        elif choice == '5':
            print("Goodbye!")
            break
        else:
            print("Invalid choice. Please try again.")

    if connection.is_connected():
        connection.close()
        print("Database connection closed.")

if __name__ == "__main__":
    main()