# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: obamzuro <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/03/20 11:09:03 by obamzuro          #+#    #+#              #
#    Updated: 2018/11/05 14:31:05 by obamzuro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = filler

SRCNAME =   main.c				\

FLAGS = -g

SRC = $(addprefix src/, $(SRCNAME))
OBJ = $(SRC:.c=.o)

HDRDIR = include		\
		 libft/include	\
		 ftprintf/include


all: lib $(NAME)

lib:
	make -C libft
	make -C ftprintf

$(NAME): $(OBJ) libft/libft.a ftprintf/libftprintf.a
	gcc $(FLAGS) $(addprefix -I, $(HDRDIR)) $(OBJ) -L libft -lft -L ftprintf -lftprintf -o $(NAME)

%.o: %.c include/filler.h
	gcc $(FLAGS) $(addprefix -I, $(HDRDIR)) -o $@ -c $<

clean:
	make -C libft clean
	make -C ftprintf clean
	rm -f $(OBJECT)
	find . -name ".*.sw[kopn]" -exec rm -rf {} \;

fclean: clean
	make -C libft fclean
	make -C ftprintf fclean
	rm -f $(NAME)

re: fclean all

.PHONY: all lib clean fclean re
