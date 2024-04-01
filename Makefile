# Inception
NAME			=	inception

COMPOSE_ROUTE = srcs/docker-compose.yml

VOLUMES := db wordpress
VOL_DIR = $(HOME)/inception
VOLUME = $(addprefix $(VOL_DIR)/,$(VOLUMES))

# Colours
RED				=	\033[0;31m
GREEN			=	\033[0;32m
YELLOW			=	\033[0;33m
BLUE			=	\033[0;34m
PURPLE			=	\033[0;35m
CYAN			=	\033[0;36m
WHITE			=	\033[0;37m
RESET			=	\033[0m

# Rules
all:		$(NAME)

$(VOLUME):
	mkdir -p $(VOLUME)

$(NAME):	$(VOLUME)
			@printf "\n$(BLUE)==> $(CYAN)Building Inception 🏗️\n\n$(RESET)"
			@docker-compose -p $(NAME) -f $(COMPOSE_ROUTE) up --build --remove-orphans
			@printf "\n$(BLUE)==> $(CYAN)Inception is running ✅\n$(RESET)"
			@printf "$(BLUE)==> $(BLUE)Accessible on: \n\t$(YELLOW)http://localhost:443\n$(RESET)"

stop:
			@docker-compose -p $(NAME) -f $(COMPOSE_ROUTE) stop
			@printf "\n$(BLUE)==> $(RED)Inception stopped 🛑\n$(RESET)"

clean:		stop
			@docker-compose -p $(NAME) -f $(COMPOSE_ROUTE) down
			@printf "\n$(BLUE)==> $(RED)Removed Inception 🗑️\n$(RESET)"

fclean:		clean
			@docker rmi alaparic_nginx:latest alaparic_mariadb:latest alaparic_wordpress:latest
			@docker volume rm $(VOLUME)
			@docker network rm db wordpress
			@printf "\n$(BLUE)==> $(RED)Removed all images 🗑️\n$(RESET)"


re:			stop
			@docker-compose -p $(NAME) -f $(COMPOSE_ROUTE) up -d --build
			@printf "$(BLUE)==> $(CYAN)Inception rebuilt 🔄\n$(RESET)"
			@printf "\n$(BLUE)==> $(CYAN)Inception is running ✅\n$(RESET)"
			@printf "$(BLUE)==> $(BLUE)Accessible on: \n\t$(YELLOW)http://localhost:443\n$(RESET)"

.PHONY:		all stop clean re
