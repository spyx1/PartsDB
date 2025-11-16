#!/bin/bash

echo "Creating allParts view..."
docker exec -i partdb_database mysql -u partdb -p23reoG487wghd partdb < sql-scripts/create-allparts.sql

echo "Loading demo data..."
docker exec -i partdb_database mysql -u partdb -p23reoG487wghd partdb < sql-scripts/demo-data.sql

echo "Setup completed!"
