from datetime import date
import math
from sqlalchemy import Column, Date, Integer, Numeric, String, create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

# 1. Crear el motor de conexión (remplaza usuario, password, host y base_datos)
USER = "postgres"
PASSWORD = "12345"
HOST = "localhost"
PORT = "5432"
DB_NAME = "ivan"

DATABASE_URL = f"postgresql+psycopg2://{USER}:{PASSWORD}@{HOST}:{PORT}/{DB_NAME}"
engine = create_engine(DATABASE_URL)

# 2. Declarar la base para los modelos
Base = declarative_base()


# 3. Definir la clase (tabla 'cotizacion')
class Cotizacion(Base):
  __tablename__ = "sexenio20"

  id = Column(Integer, primary_key=True, index=True)
  fecha = Column(Date, nullable=False)
  cotizacion = Column(Numeric(precision=10, scale=4))


# Crear las tablas en la base de datos
Base.metadata.create_all(bind=engine)

# 4. Crear una sesión para interactuar con la BD
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
session = SessionLocal()

fecha_inicio = date(2019, 1, 1)
fecha_fin = date(2024, 12, 31)

cotizaciones_2026 = (
    session.query(Cotizacion)
    .filter(Cotizacion.fecha.between(fecha_inicio, fecha_fin))
    .all()
)

# Cerrar sesión
session.close()

lista_cotizaciones = []

for cotizacion in cotizaciones_2026:
  if cotizacion.cotizacion is not None:
    # Convertimos de Decimal a float para evitar conflictos con math.sqrt
    valor = float(cotizacion.cotizacion)
    lista_cotizaciones.append(valor)


# Funciones estadísticas
def calcular_media_de(lista):
  if not lista:
    return 0
  return sum(lista) / len(lista)


def obtener_varianza_de(lista, poblacional=False):
  n = len(lista)
  if n < 2 and not poblacional:
    return 0
  if n == 0:
    return 0

  media = calcular_media_de(lista)
  suma_cuadrados = sum((x - media) ** 2 for x in lista)

  if poblacional:
    return suma_cuadrados / n  # Varianza poblacional
  else:
    return suma_cuadrados / (n - 1)  # Varianza muestral


def obtener_desviacion_estandar(lista, poblacional=False):
  varianza = obtener_varianza_de(lista, poblacional)
  return math.sqrt(varianza)


# Validar que existan datos antes de calcular
if lista_cotizaciones:
  media = calcular_media_de(lista_cotizaciones)
  varianza = obtener_varianza_de(lista_cotizaciones, poblacional=False)
  desviacion = obtener_desviacion_estandar(lista_cotizaciones, poblacional=False)
  maximo = max(lista_cotizaciones)
  minimo = min(lista_cotizaciones)
  rango = maximo - minimo

  # Mostrar resultados
  print(f"Resultados:")
  print(f"• Media: {media:.4f}")
  print(f"• Varianza: {varianza:.4f}")
  print(f"• Desviación Estándar: {desviacion:.4f}")
  print(f"• Valor Máximo: {maximo:.4f}")
  print(f"• Valor Mínimo: {minimo:.4f}")
  print(f"• Rango: {rango:.4f}")
else:
  print("No se encontraron registros en el rango de fechas especificado.")
