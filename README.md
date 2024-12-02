## Fiat and Crypto Rates API

This Go application provides an API to fetch random fiat currency and cryptocurrency rates. It includes endpoints for
fiat currency rates and cryptocurrency rates, with a 20% chance of returning a 500 Internal Server Error.

### Endpoints

#### `/fiat-currency-rates`

- **Method:** GET
- **Headers:**
    - `x-api-key`: API key for authentication (must be `secret-key`)
- **Response:**
    - **Success (200):** JSON array of currency rates
    - **Error (400):** Invalid API key
    - **Error (500):** Internal Server Error (20% chance)

#### `/crypto-currency-rates`

- **Method:** GET
- **Response:**
    - **Success (200):** JSON array of cryptocurrency rates
    - **Error (500):** Internal Server Error (20% chance)

### Response Format

#### FiatRate

```json
{
  "currency": "USD",
  "rate": 45.67
}
```

#### CryptoRate

```json
{
  "name": "BTC",
  "value": 12345.67
}
```

#### ErrorResponse

```json
{
  "error": "Invalid API key"
}
```

### Running the Application

1. **Build the application:**

```sh
   go build -o main
```

2. **Run the application:**

```sh 
./main 
```

3. **Build the Docker image:**

```sh
docker build -t currency-crypto-rates .
```

4. **Run the Docker container:**

```sh
docker run -p 8080:8080 currency-crypto-rates
```
5. **Run the Docker container with image from Docker Hub:**

```sh
docker run -p 8080:8080 docker.io/illenko/currencies-mocks:latest
```

### Example Requests

1. **Fetch Fiat Currency Rates:**

```sh
curl -H "x-api-key: secret-key" http://localhost:8080/fiat-currency-rates
```

2. **Fetch Crypto Currency Rates:**

 ```sh
curl http://localhost:8080/crypto-currency-rates
```