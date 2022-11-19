#########################
#		VARIABLES		#
#########################

# Folders and names
NAME		:= libft.a

INC_DIR		:= inc/
INC			:= libft.h

SRC_DIR		:= src/
SRC 		:= $(shell find $(SRC_DIR) -type f -name "*.c" $(DISABLED))
# SRC			:= checker/ft_isalpha.c \
# 			   checker/ft_isdigit.c \
# 			   checker/ft_isalnum.c \
# 			   checker/ft_isascii.c \
# 			   checker/ft_isprint.c \
# 			   str/ft_toupper.c \
# 			   str/ft_tolower.c \
# 			   str/ft_atoi.c \
# 			   str/ft_strdup.c \
# 			   str/ft_strchr.c \
# 			   str/ft_strrchr.c \
# 			   str/ft_strlen.c \
# 			   str/ft_strlcpy.c \
# 			   str/ft_strlcat.c \
# 			   str/ft_strncmp.c \
# 			   str/ft_strnstr.c \
# 			   str/ft_substr.c \
# 			   str/ft_strjoin.c \
# 			   str/ft_strtrim.c \
# 			   str/ft_split.c \
# 			   str/ft_itoa.c \
# 			   str/ft_strmapi.c \
# 			   str/ft_striteri.c \
# 			   mem/ft_calloc.c \
# 			   mem/ft_bzero.c \
# 			   mem/ft_memset.c \
# 			   mem/ft_memcpy.c \
# 			   mem/ft_memmove.c \
# 			   mem/ft_memchr.c \
# 			   mem/ft_memcmp.c \
# 			   io/ft_putchar_fd.c \
# 			   io/ft_putstr_fd.c \
# 			   io/ft_putendl_fd.c \
# 			   io/ft_putnbr_fd.c

# SRC_BONUS 	:= lst/ft_lstnew_bonus.c \
# 			   lst/ft_lstsize_bonus.c \
# 			   lst/ft_lstclear_bonus.c \
# 			   lst/ft_lstadd_back_bonus.c \
# 			   lst/ft_lstadd_front_bonus.c \
# 			   lst/ft_lstlast_bonus.c \
# 			   lst/ft_lstdelone_bonus.c \
# 			   lst/ft_lstiter_bonus.c \
# 			   lst/ft_lstmap_bonus.c

OBJ_DIR		:= build/
OBJ			:= $(SRC:%.c=$(OBJ_DIR)%.o)

# OBJ_BONUS	:= $(SRC_BONUS:%.c=$(OBJ_DIR)%.o)

# Compiler options
CC			:= gcc
CC_FLAGS	:= -Wextra -Werror -Wall
DEBUG_FLAG	:= -fsanitize=address

# define standard colors
_END		:=	\x1b[0m
_BOLD		:=	\x1b[1m
_UNDER		:=	\x1b[4m
_REV		:=	\x1b[7m
_GREY		:=	\x1b[30m
_RED		:=	\x1b[31m
_GREEN		:=	\x1b[32m
_YELLOW		:=	\x1b[33m
_BLUE		:=	\x1b[34m
_PURPLE		:=	\x1b[35m
_CYAN		:=	\x1b[36m
_WHITE		:=	\x1b[37m

#########################
# 		RULES			#
#########################

all: $(NAME)

echo:
	echo $(SRC)

$(NAME): $(OBJ)
	@ar rc $(NAME) $(OBJ)
	@ranlib $(NAME)
	@echo "> libft Done!\n"

$(OBJ): $(OBJ_DIR)%.o: %.c $(INC_DIR) Makefile
	@mkdir -p $(@D)
	@echo "$(_GREEN)compiling: $<$(_END)"
	@$(CC) $(CC_FLAGS) -I$(INC_DIR) -c $< -o $@

# bonus:	$(OBJ) $(OBJ_BONUS)
# 	@ar rc $(NAME) $(OBJ) $(OBJ_BONUS)
# 	@ranlib $(NAME)
# 	@echo " Bonus Done!"

# $(OBJ_BONUS): $(OBJ_DIR)%.o: %.c $(INC) Makefile
# 	@mkdir -p $(@D)
# 	@echo "$(_YELLOW)compiling: $<$(_END)"
# 	@$(CC) $(CC_FLAGS) -c $< -o $@

# clean commands
clean:
	@rm -rf $(OBJ_DIR)

fclean: clean
	@echo "remove $(NAME)"
	@rm -rf $(NAME)

re: fclean all

.PHONY: all clean fclean re
