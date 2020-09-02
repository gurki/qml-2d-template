#pragma once

#include <model/model.h>
#include <QQuickPaintedItem>


class Canvas2d : public QQuickPaintedItem
{
    Q_OBJECT

    public:

        Canvas2d( QQuickItem* parent = nullptr );

        void paint( QPainter* painter );
        void mousePressEvent( QMouseEvent* event );

        static void declareQml();

    private:

        Model model_ = {};
};
