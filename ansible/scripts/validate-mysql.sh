#!/bin/bash
echo "===================================="
echo "Validando MySQL en JasminBrockerDB"
echo "===================================="

# Test desde JasminBrockerDB (local)
echo "1. Probando conexión local..."
ssh JasminBrockerDB "mysql -u jasmin_user -pJasminPass2024! -e 'SELECT VERSION();'"

# Test desde JasminNodoA
echo ""
echo "2. Probando conexión desde JasminNodoA..."
ssh JasminNodoA "mysql -h 12.4.8.182 -u jasmin_user -pJasminPass2024! -e 'SHOW DATABASES;'"

# Test desde JasminNodoB
echo ""
echo "3. Probando conexión desde JasminNodoB..."
ssh JasminNodoB "mysql -h 12.4.8.182 -u jasmin_user -pJasminPass2024! -e 'SHOW DATABASES;'"

echo ""
echo "===================================="
echo "Validación completada"
echo "===================================="
