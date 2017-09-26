# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cchampou <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/09/26 19:13:24 by cchampou          #+#    #+#              #
#    Updated: 2017/09/26 21:23:09 by cchampou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = ft_ls

CC = clang

CFLAGS = -I$(INC_DIR) -Ilibftprintf/includes

SRC = main.c

SRC_DIR = src/

INC_DIR = includes/

OBJ_DIR = obj/

OBJ = $(SRC:.c=.o)

all: $(NAME)

$(NAME): $(OBJ_DIR) $(addprefix $(OBJ_DIR), $(OBJ))
	$(CC) $(CFLAGS) $(addprefix $(OBJ_DIR), $(OBJ)) -o $(NAME)

$(OBJ_DIR):
	mkdir $(OBJ_DIR)

$(OBJ_DIR)%.o: $(addprefix $(SRC_DIR), $(SRC))
	$(CC) $(CFLAGS) $(addprefix $(SRC_DIR), $(SRC)) -c -o $(addprefix $(OBJ_DIR), $(OBJ))

clean:
	rm -rf $(OBJ_DIR)

fclean: clean
	rm -f $(NAME)

re: fclean all



