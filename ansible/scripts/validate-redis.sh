#!/bin/bash
echo "===================================="
echo "Validando Redis en JasminBrockerDB"
echo "===================================="

REDIS_HOST="12.4.8.182"
REDIS_PASS="RedisJasmin2024!"

# Test desde JasminBrockerDB (local)
echo "1. Probando conexión local..."
ssh JasminBrockerDB "redis-cli -a ${REDIS_PASS} PING"

echo ""
echo "2. Verificando info del servidor..."
ssh JasminBrockerDB "redis-cli -a ${REDIS_PASS} INFO server | grep redis_version"

# Test desde JasminNodoA
echo ""
echo "3. Probando conexión desde JasminNodoA..."
ssh JasminNodoA "redis-cli -h ${REDIS_HOST} -a ${REDIS_PASS} PING"

# Test desde JasminNodoB
echo ""
echo "4. Probando conexión desde JasminNodoB..."
ssh JasminNodoB "redis-cli -h ${REDIS_HOST} -a ${REDIS_PASS} PING"

# Test de escritura/lectura
echo ""
echo "5. Test de escritura/lectura..."
ssh JasminNodoA "redis-cli -h ${REDIS_HOST} -a ${REDIS_PASS} SET test_key 'Jasmin SMS Gateway'"
ssh JasminNodoB "redis-cli -h ${REDIS_HOST} -a ${REDIS_PASS} GET test_key"
ssh JasminBrockerDB "redis-cli -a ${REDIS_PASS} DEL test_key"

echo ""
echo "===================================="
echo "Validación completada"
echo "===================================="
