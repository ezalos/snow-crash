#include <stdio.h>
#include <string.h>
#include <sys/fcntl.h>
#include <unistd.h>
#include <stdlib.h>

int		main(int ac, char **av)
{
	int		i;
	int		fd;
	char	*buf;
	
	(void)ac;
	buf = (char*)malloc(40);
	bzero(buf, 40);
	fd = open(av[1], O_RDONLY);
	read(fd, buf, 40);
	i = -1;;
	while (buf[++i])
		printf("%c", buf[i] -i);
	printf("\n");
	return (0);
}