#!/bin/env bash
GROUPID="org.am4283"
echo "Enter Group ID (default: org.am4283)"
read uGROUP
if [ -n "$uGROUP" ]; then 
  GROUPID=$uGROUP
fi
ARTIFACTID="app"
echo "Enter Artifact ID (default: app)"
read uART
if [ -n "$uART" ]; then
  ARTIFACTID=$uART
fi
MAINCLASS="app.Main"
echo "Enter main class, format: package.class (default: app.Main)"
read uMAIN
if [ -n "$uMAIN" ]; then
  MAINCLASS="$uMAIN"
fi
MAINFILE="$(echo "$MAINCLASS" | awk -F. '{print $2}')"

mkdir $HOME/java-projects/$ARTIFACTID
cd $HOME/java-projects/$ARTIFACTID
mkdir -p src/main/java/$ARTIFACTID
touch pom.xml

printf '<?xml version="1.0" encoding="UTF-8"?>\n' >> pom.xml
printf '<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"\n' >> pom.xml
printf '    xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">\n' >> pom.xml
printf '    <modelVersion>4.0.0</modelVersion>\n' >> pom.xml
printf '\n' >> pom.xml
printf '    <groupId>%s</groupId>\n' $GROUPID >> pom.xml
printf '    <artifactId>%s</artifactId>\n' $ARTIFACTID >> pom.xml
printf '    <packaging>jar</packaging>\n' >> pom.xml
printf '    <version>0.1.0</version>\n' >> pom.xml
printf '\n' >> pom.xml
printf '    <properties>\n' >> pom.xml
printf '        <maven.compiler.source>1.8</maven.compiler.source>\n' >> pom.xml
printf '        <maven.compiler.target>1.8</maven.compiler.target>\n' >> pom.xml
printf '    </properties>\n' >> pom.xml
printf '\n' >> pom.xml
printf '    <build>\n' >> pom.xml
printf '        <plugins>\n' >> pom.xml
printf '            <plugin>\n' >> pom.xml
printf '                <groupId>org.apache.maven.plugins</groupId>\n' >> pom.xml
printf '                <artifactId>maven-shade-plugin</artifactId>\n' >> pom.xml
printf '                <version>3.2.4</version>\n' >> pom.xml
printf '                <executions>\n' >> pom.xml
printf '                    <execution>\n' >> pom.xml
printf '                        <phase>package</phase>\n' >> pom.xml
printf '                        <goals>\n' >> pom.xml
printf '                            <goal>shade</goal>\n' >> pom.xml
printf '                        </goals>\n' >> pom.xml
printf '                        <configuration>\n' >> pom.xml
printf '                            <transformers>\n' >> pom.xml
printf '                                <transformer\n' >> pom.xml
printf '                                    implementation="org.apache.maven.plugins.shade.resource.ManifestResourceTransformer">\n' >> pom.xml
printf '                                    <mainClass>%s</mainClass>\n' $MAINCLASS >> pom.xml
printf '                                </transformer>\n' >> pom.xml
printf '                            </transformers>\n' >> pom.xml
printf '                        </configuration>\n' >> pom.xml
printf '                    </execution>\n' >> pom.xml
printf '                </executions>\n' >> pom.xml
printf '            </plugin>\n' >> pom.xml
printf '        </plugins>\n' >> pom.xml
printf '    </build>\n' >> pom.xml
printf '</project>\n' >> pom.xml

exec lvim src/main/java/$ARTIFACTID/$MAINFILE.java
exit
