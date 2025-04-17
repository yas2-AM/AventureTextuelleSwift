FROM swift:5.9

WORKDIR /app

COPY . .

CMD ["swift", "main.swift"]
