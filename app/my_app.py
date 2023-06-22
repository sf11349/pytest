
import sqlalchemy as sql
from sqlalchemy.engine import URL
import yaml
import os

def app(): 
    eng = get_engine('config.yaml')
    if eng != -1:
        with eng.connect() as conn:
            try:
                conn.execute(sql.text(open(get_sql_text('update_db.sql'),"rt").read()))
                conn.commit()
                print('\n OK!\n Updated The Database\n......................................')
            except Exception as e:
                print(e)
                conn.rollback()
                raise   
    else:
        print('ERROR')         


def get_engine(config):
    try:
        config_path = os.path.join(os.path.dirname(__file__),config)
        config = yaml.safe_load(open(config_path))
        ds = config['ds']
        print(f"\n.......................................\nDB Connection: {ds}")
        connection_url = URL.create('mssql+pyodbc', query={'odbc_connect': ds})   
        engine = sql.create_engine(connection_url,future=True,fast_executemany=True)
        return engine
    except Exception as e:
        print (e)
        return -1

def get_sql_text(file):
    return os.path.join(os.path.dirname(__file__),file)

if __name__ == '__main__':
    app()