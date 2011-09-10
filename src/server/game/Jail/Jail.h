// Copyright (C) 2011 by WarKing - DarkmoonCore - http://www.darkmooncore.org

#ifndef _JAIL_H
#define _JAIL_H

#include <Chat.h>

#define MAX_FMT_STRING  32000

struct JailKonfStruktur
{
    uint32 MaxJails;
    uint32 MaxDauer;
    uint32 MinGrund;
    uint32 MapAlly;
    uint32 MapHorde;
    uint32 BanDauer;
    uint32 Radius;
    uint32 GMAcc;
    uint32 Amnestie;

    Position AllyPos;
    Position HordePos;

    bool WarnUser;
    bool DelChar;
    bool BanAcc;
    bool Enabled;

    std::string GMChar;
};

struct JailEintragStruktur
{
    uint32 Release;
    uint32 Times;
    uint32 BTimes;
    uint32 Duration;
    uint32 GMAcc;
    uint32 Time;

    std::string CharName;
    std::string GMChar;
    std::string Reason;

    uint32 account;
};

typedef UNORDERED_MAP<uint32, JailEintragStruktur> JailMap;

class Jail
{
    friend class ACE_Singleton<Jail, ACE_Null_Mutex>;
    Jail();
    ~Jail();

private:
    JailKonfStruktur    m_JailKonf;
    JailMap             m_JailMap;

    void Amnestie();
    bool SendeInaktiv(ChatHandler * handler);
    bool Inhaftierung(ChatHandler * handler, Player * chr, std::string cname, uint32 jailtime, std::string jailreason, uint32 acc_id, std::string announce);
    bool Inhaftierung(ChatHandler * handler, uint32 guid, std::string cname, uint32 jailtime, std::string jailreason, uint32 acc_id, std::string announce);
    void BannAccount(uint32 acc_id, uint32 guid, Player * chr = NULL);
    char const * fmtstring(char const * format, ...);

public:

    bool LadeKonfiguration(bool reload = false);

    bool Init(bool reload = false);

    void KnastAufraeumen();

    void Update();


    bool InfoKommando(ChatHandler * handler);
    bool GotoKommando(ChatHandler * handler, const char * args);
    bool PInfoKommando(ChatHandler * handler, const char * args);
    bool ArrestKommando(ChatHandler * handler, const char * args);
    bool ReleaseKommando(ChatHandler * handler, const char * args, bool reset = false);
    bool ResetKommando(ChatHandler * handler, const char * args, bool force = false);
    bool ReloadKommando(ChatHandler * handler);
    bool EnableKommando(ChatHandler * handler);
    bool DisableKommando(ChatHandler * handler);

    Position HoleAllyKnastPos() const { return m_JailKonf.AllyPos; }
    Position HoleHordeKnastPos() const { return m_JailKonf.HordePos; }

    uint32 HoleAllyKnastKarte() const { return m_JailKonf.MapAlly; }
    uint32 HoleHordeKnastKarte() const { return m_JailKonf.MapHorde; }

    void Kontrolle(Player * pPlayer, bool update = false);
    void SendeWarnung(Player * pPlayer);

    JailMap const & HoleJailMap() const { return m_JailMap; }
    void AktualisiereJailMap(uint32 guid, JailEintragStruktur & JES) { m_JailMap[guid] = JES; };
};

#define sJail ACE_Singleton<Jail, ACE_Null_Mutex>::instance()

#endif