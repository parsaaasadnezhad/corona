#ifndef TEST_H
#define TEST_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>

#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonValue>

class Test : public QObject
{
    Q_OBJECT
public:

    Q_PROPERTY(bool secret READ getSecret WRITE setSecret NOTIFY secretChanged)
    Q_PROPERTY(bool secretC READ secretC WRITE setSecretC NOTIFY secretCChanged)
    Q_PROPERTY(QString date READ date WRITE setDate NOTIFY dateChanged)


    explicit Test(QObject *parent = nullptr);
    Q_INVOKABLE void fetchPosts();
    QStringList data()const;

    Q_INVOKABLE void connection(QString name);

    bool getSecret() const;

    bool secretC() const;

    QString date() const;

signals:
    void secretChanged(bool secret);

    void secretCChanged(bool secretC);

    void dateChanged(QString date);

public slots:
    void dataReadyRead();
    void dataReadFinished();

    QList<double> getGlobalInfo();

    void readyReadCountryRequest();
    void readyFinishedCountryFinished();

    //bad work
    QStringList getCountry();



    //country alone
    QList<double>getCountriesInfos();
    QList<int>getCountryLastMonthConfirmed();

    void setSecret(bool secret);

    void setSecretC(bool secretC);

    void setDate(QString date);

private:
    QNetworkAccessManager * manger;
    QNetworkReply * reply;
    QByteArray * byteArray;
    QStringList dataStringList;

//    double tc,td,Tr,nc,nd,nr;
    QList<double>global;


    QStringList countriesName;

    QList<double>countryList;
    QList<int>countryLastMonthConfirmed;

//    bool secret;

    bool m_secret;
    bool m_secretC;
    QString m_date;
};

#endif // TEST_H
