from sqlalchemy import Column,Date, Numeric, Integer, String, create_engine, text, desc
from sqlalchemy.orm import declarative_base
from sqlalchemy.orm import sessionmaker
from datetime import date
import pandas as pd

# Informacion de la conexión a la base de datos de postgreSQL
USER = "postgres"
PASSWORD = "12345"
HOST = "localhost"
PORT = "5432"
DB_NAME = "escuela_db"

DATABASE_URL = f"postgresql+psycopg2://{USER}:{PASSWORD}@{HOST}:{PORT}/{DB_NAME}"

#crear el motor de conexion de SQLAlchemy
engine = create_engine(DATABASE_URL)

# Declarar la base moderna para los modelos
Base = declarative_base()

# Definir la clase mapeada a la tabla 'calificaciones' usando el ORM
class Calificaciones(Base):
    __tablename__ = "calificaciones"

    id = Column(Integer, primary_key=True, autoincrement=True)
    alumno_id = Column(Integer, nullable=False)
    materia_id = Column(Integer, nullable=False)
    calificacion = Column(Numeric(precision=5, scale=2))

# Crear una sesión para interactuar con la BD
SessionLocal = sessionmaker(bind=engine)
session = SessionLocal()

# 1. Uso de Pandas para consultas y análisis estadístico
mi_query = session.query(Calificaciones).filter(Calificaciones.materia_id == 5)
df = pd.read_sql(mi_query.statement, session.bind)

if not df.empty:
    media = df['calificacion'].astype(float).mean()
    varianza = df['calificacion'].astype(float).var()
    desviacion_estandar = df['calificacion'].astype(float).std()

    print("Datos cargados correctamente desde Pandas:")
    print(df.head())
    print(f"\nMedia: {media}")
    print(f"Varianza: {varianza}")
    print(f"Desviación Estándar: {desviacion_estandar}")
else:
    print("No se encontraron registros.")

# 2. Demostración del uso del ORM de SQLAlchemy
primer_registro = session.query(Calificaciones).first()

if primer_registro:
    print("\n--- Consultando directamente con el ORM ---")
    print(f"ID del registro: {primer_registro.id}")
    print(f"ID del alumno: {primer_registro.alumno_id}")
    print(f"ID de la materia: {primer_registro.materia_id}")
    print(f"Calificación: {primer_registro.calificacion}")

# Cerrar la sesión
session.close()
