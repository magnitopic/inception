# Inception
NAME			=	inception

COMPOSE_ROUTE = srcs/docker-compose.yml

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

$(NAME):
			@printf "$(BLUE)==> $(CYAN)Building Inception 🏗️\n\n$(RESET)"
			docker-compose -p $(NAME) -f $(COMPOSE_ROUTE) up

stop:
		docker-compose -p $(NAME) -f $(COMPOSE_ROUTE) stop
		@printf "\n$(BLUE)==> $(RED)Inception stopped 🛑\n$(RESET)"

clean:		stop
			docker-compose -p $(NAME) -f $(COMPOSE_ROUTE) down
			@printf "\n$(BLUE)==> $(RED)Removed Inception 🗑️\n$(RESET)"

re:			clean all
			@printf "$(BLUE)==> $(CYAN)Inception rebuilt 🔄\n$(RESET)"

.PHONY:		all stop clean re
