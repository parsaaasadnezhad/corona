#include "test.h"
#include <QDebug>

Test::Test(QObject *parent) : QObject(parent)

{
    this->manger = new QNetworkAccessManager(this);
    this->reply = nullptr;
    this->byteArray = new QByteArray;
    this->m_secret = false;
    this->m_secretC = false;
    fetchPosts();

}

void Test::fetchPosts()
{
    const QUrl APT_ENDPOINT("https://api.covid19api.com/summary");        /*http://country.io/names.json*/
    QNetworkRequest request;

//    request.setRawHeader("X-Auth-Token" , "8a4f302063724b63ab3fc3bcf25df2e8");
    request.setUrl(APT_ENDPOINT);

    reply = manger->get(request);

    connect(reply , &QIODevice::readyRead ,this , &Test::dataReadyRead);
    connect(reply , &QNetworkReply::finished , this , &Test::dataReadFinished);

}

QStringList Test::data() const
{
    return this->dataStringList;
}

void Test::connection(QString name)
{
    QUrl url = "https://api.covid19api.com/total/dayone/country/" + name;
    QNetworkRequest request(url);
    this->reply = manger->get(request);

//    qInfo()<<url;

    connect(reply , &QIODevice::readyRead ,this , &Test::readyReadCountryRequest);
    connect(reply , &QNetworkReply::finished , this , &Test::readyFinishedCountryFinished);
}

bool Test::getSecret() const
{
    return m_secret;
}

bool Test::secretC() const
{
    return m_secretC;
}

QString Test::date() const
{
    return m_date;
}

void Test::dataReadyRead()
{
    //    byteArray->clear();
    //    byteArray->append(reply->readAll());
}

void Test::dataReadFinished()
{
    if(reply->error()){
        qInfo()<<"error";
    }
    else {
        QJsonDocument doc = QJsonDocument::fromJson(reply->readAll());
        QJsonObject data = doc.object();

        data = doc.object();
//        qInfo()<<data;
        qInfo()<<data["Countries"].toArray()[78].toObject()["Country"].toString();
        /*qInfo()<<"NewConfirmed"<<*/global.append(data["Global"].toObject()["NewConfirmed"].toDouble());
        /*qInfo()<<"NewDeaths"<<*/global.append(data["Global"].toObject()["NewDeaths"].toDouble());
        /*qInfo()<<"NewRecovered"<<*/global.append(data["Global"].toObject()["NewRecovered"].toDouble());
        /*qInfo()<<"TotalConfirmed"<<*/global.append(data["Global"].toObject()["TotalConfirmed"].toDouble());
        /*qInfo()<<"TotalDeaths"<<*/global.append(data["Global"].toObject()["TotalDeaths"].toDouble());
        /*qInfo()<<"TotalRecovered"<<*/global.append(data["Global"].toObject()["TotalRecovered"].toDouble());
        m_date = data["Date"].toString();
//        qInfo()<<global;
//        qInfo()<<nc;
//        qInfo()<<nd;
//        qInfo()<<nr;
//        qInfo()<<tc;
//        qInfo()<<td;
//        qInfo()<<Tr;


        QJsonArray countries = data["Countries"].toArray();
//        qInfo()<<countries;
        for(int i=0 ; i<countries.count();i++){
//            countriesName.append(countries[i].)
            countriesName.append(countries[i].toObject()["Country"].toString());
//            qInfo()<<countriesName[i];
        }

        this->m_secret = true;
    }
}

QList<double> Test::getGlobalInfo()
{

    return this->global;
}


void Test::readyReadCountryRequest()
{
//    byteArray->append(reply->readAll());
//    qInfo()<<"salam1";
}

void Test::readyFinishedCountryFinished()
{
    if(reply->error()){
        qInfo()<<"error";
    }
    else{
        QJsonDocument doc = QJsonDocument::fromJson(reply->readAll());
        QJsonObject data = doc.object();
        data = doc.object();
        QJsonArray arr = doc.array();
        QJsonObject obj = arr.last().toObject();
//        qInfo()<<arr.count()<<arr[arr.count()-2].toObject()["Confirmed"].toDouble();
        countryList.clear();
        countryLastMonthConfirmed.clear();
//        qInfo()<<obj["Confirmed"].toDouble();
        countryList.append(obj["Confirmed"].toDouble());
        countryList.append(arr.last()["Confirmed"].toDouble() - arr[arr.count()-2].toObject()["Confirmed"].toDouble());
        countryList.append(obj["Deaths"].toDouble());
        countryList.append(arr.last()["Deaths"].toDouble() - arr[arr.count()-2].toObject()["Deaths"].toDouble());
        countryList.append(obj["Recovered"].toDouble());
        countryList.append(arr.last()["Recovered"].toDouble() - arr[arr.count()-2].toObject()["Recovered"].toDouble());
        qInfo()<<countryList;

        for(int i = arr.size()-30 ; i < arr.size() ; i++){
            int value = arr[i].toObject()["Confirmed"].toDouble() - arr[i-1].toObject()["Confirmed"].toDouble();
            this->countryLastMonthConfirmed.append(value);
        }

        this->m_secretC = true;
    }

}

QStringList Test::getCountry()
{
    return countriesName;
}

QList<double> Test::getCountriesInfos()
{

    return this->countryList;
}

QList<int> Test::getCountryLastMonthConfirmed()
{
    return this->countryLastMonthConfirmed;
}

void Test::setSecret(bool secret)
{
    if (m_secret == secret)
        return;

    m_secret = secret;
    emit secretChanged(m_secret);
}

void Test::setSecretC(bool secretC)
{
    if (m_secretC == secretC)
        return;

    m_secretC = secretC;
    emit secretCChanged(m_secretC);
}

void Test::setDate(QString date)
{
    if (m_date == date)
        return;

    m_date = date;
    emit dateChanged(m_date);
}
