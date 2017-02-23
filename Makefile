# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: thou <marvin@42.fr>                        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/11/03 17:40:06 by thou              #+#    #+#              #
#    Updated: 2017/02/23 18:01:16 by thou             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME				=	libft.a
FLAG				=	-Wall -Wextra -Werror -Iincludes
SRC_DIR				=	src/
OBJ_DIR				=	obj/
LIBC_DIR			=	libc/
SUPPLEMENTAIRE_DIR	=	supplementaire/
BONUS_DIR			=	bonus/
AUTRES_DIR			=	autres/
LIBC				=	ft_atoi.c ft_isdigit.c ft_memcpy.c ft_strcmp.c ft_strncat.c ft_strstr.c ft_bzero.c ft_isprint.c ft_memmove.c ft_strcpy.c ft_strncmp.c ft_tolower.c ft_isalnum.c ft_memccpy.c ft_memset.c ft_strdup.c ft_strncpy.c ft_toupper.c ft_isalpha.c ft_memchr.c ft_strcat.c ft_strlcat.c ft_strnstr.c
SUPPLEMENTAIRE		=	ft_itoa.c ft_putendl.c ft_putstr_fd.c ft_striteri.c ft_strnew.c ft_memalloc.c ft_putendl_fd.c ft_strclr.c ft_strjoin.c ft_strsplit.c ft_memdel.c ft_putnbr.c ft_strdel.c ft_strmap.c ft_strsub.c ft_putchar.c ft_putnbr_fd.c ft_strequ.c ft_strmapi.c ft_strtrim.c ft_putchar_fd.c ft_putstr.c ft_striter.c ft_strnequ.c
BONUS				=	ft_lstadd.c ft_lstdel.c ft_lstdelone.c ft_lstiter.c ft_lstmap.c ft_lstnew.c
AUTRES				=	ft_clamp.c ft_isupper.c ft_strjoinchar.c ft_strsubc.c ft_islower.c ft_itoa_base.c ft_strjoinfree.c ft_wordnb.c
SRC_BASE			=	$(addprefix $(LIBC_DIR), $(LIBC))\
						$(addprefix $(SUPPLEMENTAIRE_DIR), $(SUPPLEMENTAIRE))\
						$(addprefix $(BONUS_DIR), $(BONUS))\
						$(addprefix $(AUTRES_DIR), $(AUTRES))
SRCS				=	$(addprefix $(SRC_DIR), $(SRC_BASE))
OBJS				=	$(addprefix $(OBJ_DIR), $(SRCS_BASE:%.c=%.o))

all: $(NAME)

$(NAME): $(OBJ_DIR) $(OBJS)
	@echo $(OBJS)
	ar -rc $(NAME) $(OBJS)
	ranlib $(NAME)

$(OBJ_DIR)%.o: $(SRC_DIR)%.c | $(OBJ_DIR)
	gcc $(FLAG) -c $< -o $@

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)
	mkdir -p $(dir $(OBJS))

f: fclean

clean:
	/bin/rm -rf $(OBJ_DIR)

fclean:	clean
	/bin/rm -rf $(NAME)

re: fclean all
