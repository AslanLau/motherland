@echo off

SET baseDir=%cd%

echo y|cacls %baseDir%/../mysql/data /G system:F everyone:F
echo y|cacls %baseDir%/../mysql/logs /G system:F everyone:F
echo y|cacls %baseDir%/../nginx/logs /G system:F everyone:F
echo y|cacls %baseDir%/../php/logs /G system:F everyone:F
echo y|cacls %baseDir%/../redis/data /G system:F everyone:F
echo y|cacls %baseDir%/../redis/logs /G system:F everyone:F

docker-compose -p v1801 -f %baseDir%/../compose/docker-compose.yml %*

