FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["IBook.API/IBook.API.csproj", "IBook.API/"]
RUN dotnet restore "IBook.API/IBook.API.csproj"
COPY . .
WORKDIR "/src/IBook.API"
RUN dotnet build "IBook.API.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "IBook.API.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
CMD ASPNETCORE_URLS=http://*:$PORT dotnet IBook.API.dll