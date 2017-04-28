from pyspark.sql import SparkSession
from pyspark.sql.types import *

spark = SparkSession \
    .builder \
    .appName("Spark Single Node Check") \
    .config("spark.some.config.option", "some-value") \
    .getOrCreate()
    
sc = spark.sparkContext
rawdata = sc.textFile('/txtFile')
data = rawdata.map(lambda l: l.split())

schemaString = "projectcode pagename pageviews bytes"

fields = [StructField(field_name, StringType(), True) for field_name in schemaString.split()]
schema = StructType(fields)

schemaData = spark.createDataFrame(data, schema)

schemaData.createOrReplaceTempView("data")

result1 = spark.sql("SELECT * FROM data WHERE pageviews > 1000")
result1.show()