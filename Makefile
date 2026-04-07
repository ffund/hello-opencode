.PHONY: all clean

all: index.md

index.md: snippets/*.md
	cat snippets/intro.md \
		snippets/install.md \
		snippets/configure-portkey.md \
		snippets/add-playwright.md \
		snippets/best-practices.md \
		> index.md

clean:
	rm -f index.md
