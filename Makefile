# Inception
NAME			=	inception

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
			@printf "$(BLUE)==> $(CYAN)Inception built ✅\n\n$(RESET)"

$(NAME):
			docker-compose up

clean:
			docker-compose down
			@printf "\n$(BLUE)==> $(RED)Removed Inception 🗑️\n$(RESET)"

re:			clean all
			@printf "$(BLUE)==> $(CYAN)Inception rebuilt 🔄\n$(RESET)"

.PHONY:		all clean re