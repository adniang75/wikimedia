# Makefile to manage tasks for building, running, and testing the application

# Colors for echo messages
GREEN=\033[0;32m
RESET=\033[0m

# Target to start Zookeeper 🏗️
# Starts the Zookeeper service
run-zookeeper:
	zookeeper-server-start /opt/homebrew/etc/kafka/zookeeper.properties
	@echo "$(GREEN)🏗️ Zookeeper started successfully!$(RESET)"

# Target to start Kafka 🏗️
# Starts the Kafka service
run-kafka:
	kafka-server-start /opt/homebrew/etc/kafka/server.properties
	@echo "$(GREEN)🏗️ Kafka started successfully!$(RESET)"

# Target to clean the project 🧹
# Cleans the project directory
clean:
	mvn clean
	@echo "$(GREEN)🧹 Cleaned successfully!$(RESET)"

# Target to compile the application 🛠️
# Compiles the application
compile: clean
	mvn compile
	@echo "$(GREEN)🛠️ Application compiled successfully!$(RESET)"

# Target to package the application 📦
# Packages the application into a distributable format
package: clean
	mvn package
	@echo "$(GREEN)📦 Application packaged successfully!$(RESET)"

# Target to test the application ✅
# Executes tests on the application
test: clean
	mvn test
	@echo "$(GREEN)✅ Tests executed successfully!$(RESET)"

# Target to run the Kafka producer 🏃
# Runs the Kafka producer application
run-producer:
	mvn spring-boot:run -pl kafka-producer-wikimedia

# Declare targets as phony labels to avoid conflicts with real file names 🎭
.PHONY: run-zookeeper run-kafka clean compile package test run-producer

# Default target that displays help on using the Makefile 📚
help:
	@echo "Usage: make [command]"
	@echo ""
	@echo "Commands:"
	@echo "  make run-zookeeper   - Starts Zookeeper"
	@echo "  make run-kafka       - Starts Kafka"
	@echo "  make clean           - Cleans the project directory"
	@echo "  make compile         - Compiles the application"
	@echo "  make package         - Packages the application into a distributable format"
	@echo "  make test            - Executes tests on the application"
	@echo "  make run-producer    - Runs the Kafka producer"
	@echo "  make help            - Displays this help screen"
