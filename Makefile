all: 
	docker-compose -f ./data/ -d --build

clean:

fclean:

re:

.PHONY: all clean fclean re