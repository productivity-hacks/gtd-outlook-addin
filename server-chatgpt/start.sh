docker build -t openai-wrapper-image .

docker run -d \
    -e OPENAI_API_KEY=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 \
    -e OPENAI_MODEL=gpt-3.5-turbo \
    openai-wrapper-image