#########################
#		VARIABLES		#
#########################

# Folders and names
NAME		:=	libftprintf.a
INCS		:=	ft_printf.h
INCS_DIR	:=	inc

SRCS_DIR	:=	srcs/
SRCS		:=	ft_printf.c \
				ft_pick_conversion.c \
				ft_print_decimal.c \
				ft_print_unsigned_int.c \
				ft_print_string.c \
				ft_print_pointer.c \
				ft_print_size_t_base.c \
				ft_print_hex.c

LIBFT_A		:=	libft.a
LIBFT_DIR	:=	libft/

OBJS_DIR	:=	objs/
OBJS		:=	$(SRCS:%.c=$(OBJS_DIR)%.o)

# SRCS_BONUS := 
#OBJS_BONUS	:= $(SRCS_BONUS:%.c=$(OBJS_DIR)%.o)

# Compiler options
CC			:=	gcc
CC_FLAGS	:=	-Wextra -Werror -Wall
DEBUG_FLAG	:=	-fsanitize=address

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

all: build_lib $(NAME)

$(NAME): build_lib $(OBJS)
	@cp libft/libft.a $(NAME)
	@ar -rcu $(NAME) $(OBJS)
	@ranlib $(NAME)
	@echo "> ft_printf Done !\n"

build_lib: $(LIBFT_DIR)
	@$(MAKE) -C $(LIBFT_DIR)

#$(OBJS): $(OBJS_DIR)%.o: $(SRCS_DIR)%.c $(INCS_DIR) $(LIBFT_DIR) Makefile
$(OBJS): $(OBJS_DIR)%.o: $(SRCS_DIR)%.c $(LIBFT_DIR) $(INCS_DIR) Makefile
	@mkdir -p $(@D)
	@echo "$(_GREEN)compiling: $<$(_END)"
	@$(CC) $(CC_FLAGS) -I$(INCS_DIR) -I$(LIBFT_DIR) -c $< -o $@

# clean commands
clean:
	@$(MAKE) clean -C $(LIBFT_DIR)
	@rm -rf $(OBJS_DIR)

fclean: clean
	@echo "remove $(NAME)"
	@rm -rf $(NAME)
	@echo "remove $(LIBFT_DIR)$(LIBFT_A)"
	@rm -rf "$(LIBFT_DIR)$(LIBFT_A)"

re: fclean all

.PHONY: all clean fclean re norm print_clean test
