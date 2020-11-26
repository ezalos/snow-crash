import sys


if __name__ == '__main__':
	src = sys.argv[1]
	for _ in range(3):
		dest = ""
		for i, c in enumerate(src):
			print(c)
			a = ord(c) - i
			dest += chr(a)
		print(dest)
		src = dest