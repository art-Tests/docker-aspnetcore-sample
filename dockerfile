FROM microsoft/dotnet:2.1-sdk as build
WORKDIR /app

COPY *.csproj ./
RUN dotnet restore


COPY . ./
RUN dotnet publish -c release -o out
ENTRYPOINT ["dotnet","out/docker-dotnetcore.dll"]

## docker build -t test-docker
## and then docker run -it --rm -p 80:80