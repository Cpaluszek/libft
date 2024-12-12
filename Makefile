NAME := libft.a

INCLUDE_DIR := inc
INC_FILES := libft.h
INCS := $(addprefix $(INCLUDE_DIR)/, $(INC_FILES))

SRC_DIR := src
SRC_FILES := checker/ft_isalpha.c \
			 checker/ft_isdigit.c \
			 checker/ft_isalnum.c \
			 checker/ft_isascii.c \
			 checker/ft_isprint.c \
			 checker/ft_isspace.c \
			 str/ft_toupper.c \
			 str/ft_tolower.c \
			 str/ft_atoi.c \
			 str/ft_strdup.c \
			 str/ft_strchr.c \
			 str/ft_strrchr.c \
			 str/ft_strlen.c \
			 str/ft_strlcpy.c \
			 str/ft_strlcat.c \
			 str/ft_strncmp.c \
			 str/ft_strnstr.c \
			 str/ft_substr.c \
			 str/ft_strjoin.c \
			 str/ft_strjoin_and_free.c \
			 str/ft_strtrim.c \
			 str/ft_split.c \
			 str/ft_itoa.c \
			 str/ft_strmapi.c \
			 str/ft_striteri.c \
			 mem/ft_calloc.c \
			 mem/ft_bzero.c \
			 mem/ft_memset.c \
			 mem/ft_memcpy.c \
			 mem/ft_memmove.c \
			 mem/ft_memchr.c \
			 mem/ft_memcmp.c \
			 mem/ft_free.c \
			 mem/ft_free_split.c \
			 io/ft_putchar_fd.c \
			 io/ft_putstr_fd.c \
			 io/ft_putendl_fd.c \
			 io/ft_putnbr_fd.c \
			 io/ft_printf/ft_printf.c \
			 io/ft_printf/ft_pick_conversion_fd.c \
			 io/ft_printf/ft_print_decimal_fd.c \
			 io/ft_printf/ft_print_hex_fd.c \
			 io/ft_printf/ft_print_pointer_fd.c \
			 io/ft_printf/ft_print_size_t_base_fd.c \
			 io/ft_printf/ft_print_string_fd.c \
			 io/ft_printf/ft_print_unsigned_int_fd.c \
			 io/ft_printf/ft_printf_fd.c \
			 io/gnl/get_next_line.c \
			 utils/swap_int.c \
			 lst/ft_lstnew.c \
			 lst/ft_lstsize.c \
			 lst/ft_lstclear.c \
			 lst/ft_lstadd_back.c \
			 lst/ft_lstadd_front.c \
			 lst/ft_lstlast.c \
			 lst/ft_lstdelone.c \
			 lst/ft_lstiter.c \
			 lst/ft_lstmap.c
SRCS := $(addprefix $(SRC_DIR)/,$(SRC_FILES))

BUILD_DIR := build
OBJS := $(SRC_FILES:%.c=$(BUILD_DIR)/%.o)
DEPS := $(SRC_FILES:%.c=$(BUILD_DIR)/%.d)

CC := gcc
CC_FLAGS := -Wextra -Werror -Wall

all: $(NAME)

echo:
	echo $(INCLUDE_DIR)
	echo $(INCS)

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c $(INCS)
	mkdir -p $(@D)
	$(CC) $(CC_FLAGS) -I$(INCLUDE_DIR) -c $< -o $@

-include $(DEPS)

clean:
	rm -rf $(BUILD_DIR)

fclean: clean
	rm -rf $(NAME)

re: fclean all

.PHONY: all clean fclean re
