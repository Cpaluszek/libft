#########################
#		VARIABLES		#
#########################

# Folders and names
NAME		:= libft.a
INCS		:= libft.h
OBJS_DIR	:= objs/

SRCS		:= ft_isalpha.c \
			   ft_isdigit.c \
			   ft_isalnum.c \
			   ft_isascii.c \
			   ft_isprint.c \
			   ft_toupper.c \
			   ft_tolower.c \
			   ft_atoi.c \
			   ft_strdup.c \
			   ft_strchr.c \
			   ft_strrchr.c \
			   ft_strlen.c \
			   ft_strlcpy.c \
			   ft_strlcat.c \
			   ft_strncmp.c \
			   ft_strnstr.c \
			   ft_substr.c \
			   ft_strjoin.c \
			   ft_strtrim.c \
			   ft_split.c \
			   ft_itoa.c \
			   ft_strmapi.c \
			   ft_striteri.c \
			   ft_calloc.c \
			   ft_bzero.c \
			   ft_memset.c \
			   ft_memcpy.c \
			   ft_memmove.c \
			   ft_memchr.c \
			   ft_memcmp.c \
			   ft_putchar_fd.c \
			   ft_putstr_fd.c \
			   ft_putendl_fd.c \
			   ft_putnbr_fd.c

SRCS_BONUS :=  ft_lstnew_bonus.c \
			   ft_lstsize_bonus.c \
			   ft_lstclear_bonus.c \
			   ft_lstadd_back_bonus.c \
			   ft_lstadd_front_bonus.c \
			   ft_lstlast_bonus.c \
			   ft_lstdelone_bonus.c \
			   ft_lstiter_bonus.c \
			   ft_lstmap_bonus.c

OBJS		:= $(SRCS:%.c=$(OBJS_DIR)%.o)

OBJS_BONUS	:= $(SRCS_BONUS:%.c=$(OBJS_DIR)%.o)

# Compiler options
CC			:= gcc
CC_FLAGS	:= -Wextra -Werror -Wall
DEBUG_FLAG	:= -fsanitize=address

# define standard colors
BLACK		:= $(shell tput -Txterm setaf 0)
RED			:= $(shell tput -Txterm setaf 1)
GREEN		:= $(shell tput -Txterm setaf 2)
YELLOW		:= $(shell tput -Txterm setaf 3)
LIGHTPURPLE	:= $(shell tput -Txterm setaf 4)
PURPLE		:= $(shell tput -Txterm setaf 5)
BLUE		:= $(shell tput -Txterm setaf 6)
WHITE		:= $(shell tput -Txterm setaf 7)
RESET		:= $(shell tput -Txterm sgr0)

#########################
# 		RULES			#
#########################

all: $(NAME)

$(NAME): $(OBJS)
	@ar rc $(NAME) $(OBJS)
	@ranlib $(NAME)
	@echo " Done!"

$(OBJS): $(OBJS_DIR)%.o: %.c $(INCS) Makefile
	@mkdir -p $(@D)
	@echo "$(GREEN)compiling: $<$(RESET)"
	@$(CC) $(CC_FLAGS) -c $< -o $@

bonus:	$(OBJS) $(OBJS_BONUS)
	@ar rc $(NAME) $(OBJS) $(OBJS_BONUS)
	@ranlib $(NAME)
	@echo " Bonus Done!"

$(OBJS_BONUS): $(OBJS_DIR)%.o: %.c $(INCS) Makefile
	@mkdir -p $(@D)
	@echo "$(YELLOW)compiling: $<$(RESET)"
	@$(CC) $(CC_FLAGS) -c $< -o $@

# clean commands
clean: print_clean
	@echo "remove all objects files"
	@rm -rf $(OBJS_DIR)

fclean: clean
	@echo "remove $(NAME)"
	@rm -rf $(NAME)

re: fclean all

# print
print_clean:
	@echo "\n$(RED)> Clean$(RESET)"

.PHONY: all clean fclean re norm print_clean bonus
