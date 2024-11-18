# This code is mostly  just for testing purposes

import psycopg
import os

with psycopg.connect(dbname=os.getenv("POSTGRES_DB"),
                     user=os.getenv("POSTGRES_USER"),
                     password=os.getenv("POSTGRES_PASSWORD"),
                     host="localhost",
                     autocommit=True) as conn:
    with conn.cursor() as cur:
        cur.execute("SELECT * FROM information_schema.tables")
        print(cur.fetchall())

        cur.fetchone()
        for record in cur:
            print(record)

        conn.commit()

    
